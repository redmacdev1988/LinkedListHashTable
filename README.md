# LinkedListHashTable
Hash Table (array of linked lists)


The linked list is a stack. It adds by pushing. However, you can delete in the middle. I've used a trailer and a current pointer to delete nodes, and repoint the trainer's next to the current' next to re-hook the list.

<h3>Hashing technique</h3>

<pre>
NSInteger value = 0;
    
    //1. get the length of the string key
    for (NSInteger i = 0; i < itemKey.length; i++) {
        
        //2. collect all the ascii value of the characters
        int ascii = (int)[itemKey characterAtIndex:i];
        value += ascii;
    }
    
    return (value * itemKey.length) % MAX_CAPACITIY;

</pre>
