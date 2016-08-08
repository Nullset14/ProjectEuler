use std::fs::File;
use std::io::Read;

fn main() {
    let mut f = File::open("p022_names.txt").unwrap();
    let mut buffer = String::new();
    f.read_to_string(&mut buffer).unwrap();
    let mut names: Vec<&str> = buffer.split(',').collect();
    names.sort();

    let mut total_score = 0;
    for (index, name) in names.iter().enumerate() {
        let mut score = 0;
        for char in name.chars() {
            if char == '"' {
                continue;
            }
            score += char as usize - 64;
        }
        total_score += score * (index + 1);
    }

    println!("{}", total_score);
}
