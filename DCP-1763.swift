// Problem 1763
// Sorting a million numbers

import Foundation

class ExternalMergeSort {
    let chunkSize: Int
    let inputFile: String
    let outputFile: String
    
    init(chunkSize: Int, inputFile: String, outputFile: String) {
        self.chunkSize = chunkSize
        self.inputFile = inputFile
        self.outputFile = outputFile
    }
    
    func sort() throws {
        // Step 1: Divide the input into sorted chunks
        let chunkFiles = try divideAndSortChunks()
        
        // Step 2: Merge the sorted chunks
        try mergeChunks(chunkFiles)
    }
    
    private func divideAndSortChunks() throws -> [String] {
        var chunkFiles: [String] = []
        let fileManager = FileManager.default
        
        guard let inputStream = InputStream(fileAtPath: inputFile) else {
            throw NSError(domain: "ExternalMergeSort", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to open input file"])
        }
        inputStream.open()
        defer { inputStream.close() }
        
        var chunkNumber = 0
        while inputStream.hasBytesAvailable {
            var chunk: [Int] = []
            for _ in 0..<chunkSize {
                var number: Int32 = 0
                let bytesRead = inputStream.read(&number, maxLength: MemoryLayout<Int32>.size)
                if bytesRead == 0 { break }
                chunk.append(Int(number))
            }
            
            chunk.sort()
            
            let chunkFile = "chunk_\(chunkNumber).tmp"
            let chunkURL = URL(fileURLWithPath: chunkFile)
            try Data(chunk.withUnsafeBytes { Data($0) }).write(to: chunkURL)
            chunkFiles.append(chunkFile)
            chunkNumber += 1
        }
        
        return chunkFiles
    }
    
    private func mergeChunks(_ chunkFiles: [String]) throws {
        guard let outputStream = OutputStream(toFileAtPath: outputFile, append: false) else {
            throw NSError(domain: "ExternalMergeSort", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unable to open output file"])
        }
        outputStream.open()
        defer { outputStream.close() }
        
        var heapArray: [(value: Int, fileIndex: Int)] = []
        var fileStreams: [InputStream] = []
        
        // Open all chunk files
        for (index, chunkFile) in chunkFiles.enumerated() {
            guard let inputStream = InputStream(fileAtPath: chunkFile) else { continue }
            inputStream.open()
            fileStreams.append(inputStream)
            
            var firstValue: Int32 = 0
            let bytesRead = inputStream.read(&firstValue, maxLength: MemoryLayout<Int32>.size)
            if bytesRead > 0 {
                heapArray.append((Int(firstValue), index))
            }
        }
        
        // Create a min-heap
        heapArray.sort { $0.value < $1.value }
        
        while !heapArray.isEmpty {
            let (minValue, fileIndex) = heapArray.removeFirst()
            
            var valueToWrite = Int32(minValue)
            outputStream.write(&valueToWrite, maxLength: MemoryLayout<Int32>.size)
            
            var nextValue: Int32 = 0
            let bytesRead = fileStreams[fileIndex].read(&nextValue, maxLength: MemoryLayout<Int32>.size)
            if bytesRead > 0 {
                heapArray.append((Int(nextValue), fileIndex))
                heapArray.sort { $0.value < $1.value }
            }
        }
        
        // Close and delete temporary files
        for (index, stream) in fileStreams.enumerated() {
            stream.close()
            try FileManager.default.removeItem(atPath: chunkFiles[index])
        }
    }
}

// Usage
let sorter = ExternalMergeSort(chunkSize: 100000, inputFile: "input.bin", outputFile: "output.bin")
do {
    try sorter.sort()
    print("Sorting completed successfully")
} catch {
    print("Error occurred: \(error)")
}
