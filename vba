import socket
import os

class HTTPServer:
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.bind((self.host, self.port))

    def start(self):
        self.socket.listen(5)
        print(f"Server listening on {self.host}:{self.port}")
        while True:
            client_socket, client_address = self.socket.accept()
            print(f"Client connected from {client_address[0]}:{client_address[1]}")
            client_handler = ClientHandler(client_socket)
            client_handler.handle_request()

class ClientHandler:
    def __init__(self, client_socket):
        self.socket = client_socket

    def handle_request(self):
        request_data = self.socket.recv(1024).decode("utf-8")
        if request_data:
            method, path, _ = request_data.split(" ", 2)
            if method == "GET":
                self.handle_get(path)
            elif method == "PUT":
                self.handle_put(path)
        self.socket.close()

    def handle_get(self, path):
        file_path = os.path.join(os.getcwd(), path[1:])
        if os.path.exists(file_path):
            with open(file_path, "rb") as file:
                file_data = file.read()
            response = b"HTTP/1.1 200 OK\r\n\r\n" + file_data
        else:
            response = b"HTTP/1.1 404 Not Found\r\n\r\nFile not found"
        self.socket.sendall(response)

    def handle_put(self, path):
        file_path = os.path.join(os.getcwd(), path[1:])
        _, _, content = request_data.split("\r\n", 2)
        with open(file_path, "wb") as file:
            file.write(content.encode("utf-8"))
        response = b"HTTP/1.1 200 OK\r\n\r\nFile created"
        self.socket.sendall(response)

    def handle_get(self, path):
        file_path = os.path.join(os.getcwd(), path[1:])
        try:
            with open(file_path, "rb") as file:
                file_data = file.read()
            response = b"HTTP/1.1 200 OK\r\n\r\n" + file_data
        except FileNotFoundError:
            response = b"HTTP/1.1 404 Not Found\r\n\r\nConexao feita com sucesso"
        self.socket.sendall(response)

if __name__ == "__main__":
    server = HTTPServer("localhost", 80)
    server.start()
