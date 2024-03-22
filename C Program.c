#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main() {
  // Open the file "my_file.txt" with read/write access and create it if it doesn't exist
  int fd = open("my_file.txt", O_RDWR | O_CREAT, 0664);

  // Check if opening the file was successful
  if (fd == -1) {
    perror("open");
    exit(1);
  }

  // Content to write to the file
  const char *message = "Hello World\n";

  // Write the message to the file
  ssize_t bytes_written = write(fd, message, strlen(message));

  // Check if writing to the file was successful
  if (bytes_written == -1) {
    perror("write");
    close(fd);  // Close the file even on error
    exit(1);
  }

  printf("Successfully wrote %ld bytes to the file.\n", bytes_written);

  // Move the file pointer back to the beginning of the file for reading
  lseek(fd, 0, SEEK_SET);

  // Buffer to store the read content
  char buffer[100];

  // Read content from the file
  ssize_t bytes_read = read(fd, buffer, sizeof(buffer) - 1);

  // Check if reading from the file was successful
  if (bytes_read == -1) {
    perror("read");
    close(fd);  // Close the file even on error
    exit(1);
  }

  // Add null terminator to the buffer (in case the entire buffer wasn't read)
  buffer[bytes_read] = '\0';

  // Print the read content
  printf("Read content from the file: %s\n", buffer);

  // Close the file
  if (close(fd) == -1) {
    perror("close");
    exit(1);
  }

  printf("File closed successfully.\n");

  return 0;
}
