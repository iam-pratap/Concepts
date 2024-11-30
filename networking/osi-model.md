## OSI Model(Open System Interconnection Model)

OSI Model defines and used to understand how data is transferred from one computer to another in computer network.

- In the most basic form, two computers connected to each other with LAN Cable and Connectors(RJ45) sharing data with the help of network interface card forms a network
but if one computer is based on microsoft window and other one has macos installed then these computers are communicate to each other.

- In oder to accomplish successfull communication computer netwoks and different architecture then osi layer introduced by ISO 1984.

- Each layer is packet of protocol

![osi-model-7-layers](https://github.com/user-attachments/assets/27e7fd2d-e8bf-4fff-b5a5-9037cfd8998c)

#### 1. Application Layer

- The top layer, interacting directly with the user.
- Includes protocols like HTTP, FTP, SMTP, and others.
- It's like the user interface, where you interact with the network services.

#### 2. Presentation Layer

- Handles data encryption, compression, and formatting.
- Ensures data is in a suitable format for the application layer.
- It's like the translator, converting data into a language the application understands.
  
  e.g asciii <---->0110100

#### 3. Session Layer

- Manages and synchronizes communication sessions between devices.
- Establishes, maintains, and terminates connections.
- It's like the meeting coordinator, setting up and managing the conversation.

  APIs, NetBIOS, Authentication, Athorisation

#### 4. Transport Layer

- Provides reliable end-to-end communication between devices.
- Handles flow control, error checking, and segmentation/reassembly of data.
- It's like the delivery truck, ensuring packages arrive intact and in the right order.
  
transport --it controls the reliabily of communication through segmentatin, flow control, error control

Segmentation ---> data recieved from session layer is divided into small data units called

each segment contains --> sequence number, port number

flow control the amount of data being transmitted

connection-oriented transmission ---->tcp

connectionless transmission -->udp it is faster becoz it does not provide feedback

routing is method of moving data packets from source to detination

#### 3. Network Layer

Responsible for routing data across different networks.
Assigns IP addresses and handles packet switching.
It's like the interstate highway system, routing traffic across the country.

logical addressing is done on network layer----> iP

#### 2. Data Link Layer

Focuses on reliable data transfer between devices on the same network.
Breaks data into frames, adds error detection/correction, and handles media access control (MAC) addresses.
It's like the postal system, ensuring packages reach the right address on the same street.

physical addressing done on dtat link layer ---->mac address

#### 1. Physical Layer

The very bottom layer, dealing with the physical transmission of bits (0s and 1s).
Handles things like cables, connectors, and electrical signals.
It's like the raw wiring and sockets that carry the data.






