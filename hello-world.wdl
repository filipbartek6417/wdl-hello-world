version 1.0

workflow hello_world {
  input {
    String name = "World"
  }

  call say_hello { input: name = name }

  output {
    String greeting = say_hello.greeting
  }
}

task say_hello {
  input {
    String name
  }

  command {
    echo "Hello, ~{name}!"
  }

  output {
    String greeting = read_string(stdout())
  }

  runtime {
        docker: "ubuntu:latest"
  }
}

