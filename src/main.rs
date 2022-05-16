use std::env;
use std::io::prelude::*;
use std::fs;

fn main() {
    let args: Vec<String> = env::args().collect();
    let name: String = args[1].clone();

    // let query = &args[1];
    // let filename = &args[2];

    // println!("Searching for {} in {}", query, filename);
    println!("Hello, {}", name);

    let mut file = fs::File::create("hello-rust.txt").unwrap();
    write!(file,"Hello, {}\n", name).unwrap();
}
