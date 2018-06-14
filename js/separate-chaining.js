class Node {
    constructor(newData, newNext) {
      this.data = newData;
      this.next = newNext;
    }
    display() { process.stdout.write(`${this.data}\t`); }
    // Memory management is done indirectly via breaking references
    freeMemory() {
      console.log(`Ø freeing memory for node ${this.data}`);
      this.data = null;
      this.next = null;
    }
}

class Queue {
  constructor() {
      this._head = null;
      this._tail = null;
  }

  push(newData) {
    if (!this._head && !this._tail) {
      this._head = new Node(newData, this._head);
      this._tail = this._head;
      return;
    }

    this._tail.next = new Node(newData, null);
    this._tail = this._tail.next;
  }

  search(newData) {
      for (let temp = this._head; temp != null; temp = temp.next) {
        if(temp.data === newData) {
          return temp;
        }
      }
      console.log(`(queue) - cannot find ${newData}`);
      return null;
  }

  delete(toRemove) {
    for(let tmp = this._head, trailer = tmp;
            tmp != null && trailer != null;
            trailer = tmp, tmp = tmp.next) {
        if(tmp.data === toRemove) { // if matches
          if (tmp === this._head) {
            this._head = this._head.next;
          } else {
            trailer.next = tmp.next;
          }
          tmp.freeMemory();
          return true;
        } // match
    }
    return false;
  }


  pop() {
    if (this._head && this._tail) {
      let temp = this._head;
      this._head = this._head.next;
      temp.freeMemory();
      // if removing the last node
      if (!this._head) {this._tail = null;}
      return true;
    } else {
      console.log(`No more items to remove from Queue`);
      return false;
    }

  }

  print() {
    console.log(`--- print (queue) ---`);
    if (!this._head) {
      console.log(`nothing to print`);
      return;
    }

    for(let temp = this._head; temp != null; temp = temp.next) {
      temp.display();
    }
    console.log(`\n`);
  }

}



class Stack {
  constructor() {
     // public
     this._head = null;
  }

  // functions are added  to the prototype

  push(newData) {
    this._head = new Node(newData, this._head);
  }

  search(data) {
      for(let temp = this._head; temp != null; temp = temp.next) {
        if (temp.data === data) {
          return temp;
        }
      }
      console.log(`(stack) - ${data} not found`);
  }

  // O(n)
  delete(dataToMatch) {
    console.log(`stack - attempting to delete ${dataToMatch}`);

    for(let temp = this._head, trailer = temp;
                    trailer !=null && temp !=null;
                    trailer = temp, temp = temp.next ) {
      if (temp.data === dataToMatch) {
        if (temp === this._head) { this._head = this._head.next; }
        else { trailer.next = temp.next; }
        temp.freeMemory();
        return true;
      }
    } // for
    return false;
  }


  pop() {
    if (this._head) {
      let temp = this._head;
      this._head = this._head.next;
      temp.freeMemory();
      return true;
    } else {
      console.log(`Stack empty. Nothing to remove`);
      return false;
    }
  }

  print() {
    console.log("--- print (stack)---");
    if (!this._head) { console.log(`Stack is empty. Nothing to print`); return; }
    for(let iterator = this._head; iterator != null; iterator = iterator.next) {
      iterator.display();
    }
    console.log("\n");
  }

}


class List {
  constructor(choice) {
    this._list = (choice === 0) ? new Stack(): new Queue();
  }
  insert(newData) {this._list.push(newData);}
  search(newData) {return this._list.search(newData);}
  delete(toRemove) { return this._list.delete(toRemove); }
  print() { this._list.print(); }
}


class HashTable {
  constructor() {
    var MAX = 13;

    var table = new Array(MAX);

    function hash(data) {
      if (typeof data !== "string") {
          console.log(`hash - input must be string!`);
          return null;
      }
      let value = 0;
      for (let i = 0; i < data.length; i++) {
          value += data[i].charCodeAt(0);
      }
      return (value * data.length) % MAX;
    }

    function randomPickForList() {
      return (Math.random() >= 0.5) ? 1 : 0;
    }

    // load factor α = num of keys to be inserted / number of slots in hash table
    // O(1 + α)
    this.insert = function(data) {
      let index = hash(data);
      if (!table[index]) { table[index] = new List(randomPickForList()); }
      table[index].insert(data);
    }

    // load factor α = num of keys to be inserted / number of slots in hash table
    // O(1 + α)
    this.search = function(data) { return table[hash(data)].search(data); }

    // load factor α = num of keys to be inserted / number of slots in hash table
    // O(1 + α)
    this.delete = function(data) {
      // data to delete
      let index = hash(data);
      if (table[index].delete(data)) {
        console.log(`√ removed ${data} successfully`);
      } else {
        console.log(`list (delete) - ${data} not found`);
      }
    }


    this.print = function() {
      console.log(`\n\n======= print table of length ${table.length}========`);

      for (let i = 0; i < table.length; i++) {
          console.log(`--- ${i} ---`);
          let bucket = table[i];
          if (bucket) {
            bucket.print();
          } else {
            console.log(`empty`);
          }
      }

    }

  } // constructor
}


let h = new HashTable();
h.insert("ricky");
h.insert("christy");
h.insert("neo");
h.insert("Eric");
h.insert("Micky Mouse");
h.insert("Buckingham");
h.insert("Fortran");
h.insert("giggles");
h.insert("zion");
h.insert("Prometheus");
h.insert("Cao Hai Shang");
h.insert("Lu Shang Xian");
h.print();

console.log(h.search("Eric"));
console.log(h.search("Prometheus"));
console.log(h.search("Fortran"));
console.log(h.search("ricky"));
console.log(h.search("hadoken"));

h.delete("ricky");
h.print();
h.delete("Eric");
h.print();
h.delete("neo");
h.print();
h.delete("Prometheus");
h.delete("zion");
h.delete("giggles");
h.print();
