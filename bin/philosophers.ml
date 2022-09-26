let number = 2 in 
let philosopher id = 
  let left = id in
  let right = (id + 1) mod number in
  
  let eat () = 
    Printf.printf "Philosopher %d is eating plate using forks left:%d, right:%d.\n" id left right;
    Thread.delay 0.3;
    Printf.printf "Philosopher %d has finished eating.\n" id;
    flush stdout;
  in

  let think () = 
    Printf.printf "Philosopher %d is thinking.\n" id;
    flush stdout;
    Thread.delay 0.2; 
  in

  let rec loop alt = 
    if alt then 
      begin
        eat ();
        loop false
      end
    else 
      think ();
      loop true
  in
    loop true;
in
let threads = List.init number (fun n -> Thread.create philosopher n) in
Thread.join (List.hd threads)
