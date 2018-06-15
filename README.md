# LinkedListHashTable
* https://en.wikipedia.org/wiki/Hash_table
* https://stackoverflow.com/questions/9214353/hash-table-runtime-complexity-insert-search-and-delete


Hash Table (separate chaining)

In the simplest terms, a hash table is an array. It holds data by having incoming
data go through a hash. Depending on the data input, the hash will return an index for the array. Then, through 1 step, we insert the data at the given index.

Searching simply involves giving it the data we want, getting the index back
from the hash, and then accessing the object at the array element.

In other words, the idea of hashing is to distribute the entries (key/value pairs) across an array of buckets. Given a key, the algorithm computes an index that suggests where the entry can be found:

```index = f(key, array_size)```

Often this is done in two steps:

```
hash = hashfunc(key)
index = hash % array_size
```

Therefore, the strength of a hash table is that insertion, deletion, and searching is O(1) time.

- **Space**		   Average O(n)[1]	  Worst case O(n)<br />
- **Search**		 Average  O(1)	    Worst case O(n)<br />
- **Insert**		 Average O(1)	    Worst case O(n)<br />
- **Delete**		 Average O(1)	    Worst case O(n)<br />

The reason why worst case is O(n) is because all of your objects may be hashed
to the exact same bucket say at index 3. Essentially, you just have a list
going on at index 3. Thus, this degrades to a standard list where in order to
insert something, you traverse the list. In order to delete/search something, you traverse the list.

In other words, hash tables suffer from O(n) worst time complexity due to two reasons:

If too many elements were hashed into the same key: looking inside this key may take O(n) time.

**load balance (load factor)**

load = n / k,

**n** is number of entires OCCUPIED in the hash table.
**k** is the number of buckets.

So in an array, if there are 13 buckets, and after inserting some entries, 8 buckets are occupied, then we have load balance of 8 / 13, or 61.5%.

Say we set a load balance of 80%. Once a hash table has passed its load balance - it has to rehash [create a new bigger table, and re-insert each element to the table].

In many situations, hash tables turn out to be on average more efficient than search trees or any other table lookup structure. For this reason, they are widely used in many kinds of computer software, particularly for associative arrays, database indexing, caches, and sets.

## Issues

However, we have to deal with collision. Collision is when two data inputs, after
going through the hash algorithm function, will return you the same index.
Thus, we have a collision at the element given by the index.

Hash collisions are practically unavoidable when hashing a random subset of a large set of possible keys. For example, if 2,450 keys are hashed into a million buckets, even with a perfectly uniform random distribution, according to the birthday problem there is approximately a 95% chance of at least two of the keys being hashed to the same slot.

Therefore, almost all hash table implementations have some collision resolution strategy to handle such events.

## Separate chaining

In the method known as separate chaining, each bucket is independent, and has some sort of list of entries with the same index. The time for hash table operations is the time to find the bucket (which is constant) plus the time for the list operation.

In a good hash table, each bucket has zero or one entries, and sometimes two or three, but rarely more than that. Therefore, structures that are efficient in time and space for these cases are preferred. Structures that are efficient for a fairly large number of entries per bucket are not needed or desirable. If these cases happen often, the hashing function needs to be fixed.

## Using linked list such as Queue or Stack

Chained hash tables with linked lists are popular because they require only basic data structures with simple algorithms, and can use simple hash functions that are unsuitable for other methods.

The cost of a table operation is that of scanning the entries of the selected bucket for the desired key. If the distribution of keys is sufficiently uniform, the average cost of a lookup depends only on the average number of keys per bucket—that is, it is roughly proportional to the load factor.

For this reason, chained hash tables remain effective even when the number of table entries n is much higher than the number of slots. For example, a chained hash table with 1000 slots and 10,000 stored keys (load factor 10 --> 10,000/1000 = 10) is five to ten times slower than a 10,000-slot table (load factor 1, 10,000/10,000 = 1); but still 1000 times faster than a plain sequential list.

For separate-chaining, **the worst-case scenario** is when all entries are inserted into the same bucket, in which case the hash table is ineffective and the cost is that of searching the bucket data structure. If the latter is a linear list, the lookup procedure may have to scan all its entries, so the worst-case cost is proportional to the number n of entries in the table.

The bucket chains are often searched sequentially using the order the entries were added to the bucket. If the load factor is large and some keys are more likely to come up than others, then rearranging the chain with a move-to-front heuristic may be effective.

More sophisticated data structures, such as balanced search trees, are worth considering only if the load factor is large (about 10 or more), or if the hash distribution is likely to be very non-uniform, or if one must guarantee good performance even in a worst-case scenario. However, using a larger table and/or a better hash function may be even more effective in those cases.

## Chained hash tables also inherit the disadvantages of linked lists.

When storing small keys and values, the **space overhead of the next pointer** in each entry record can be significant. In other words, they use more memory than arrays because of the storage used by their pointers. An additional disadvantage is that traversing a linked list has poor cache performance, **making the processor cache ineffective**. This means that nodes are stored incontiguously, greatly increasing the time required to access individual elements within the list, especially with a CPU cache.

## Separate Chaining with list head cells

Some chaining implementations store the first record of each chain in the slot array itself. The number of pointer traversals is decreased by one for most cases. The purpose is to increase cache efficiency of hash table access.

The disadvantage is that an empty bucket takes the same space as a bucket with one entry. To save space, such hash tables often have about as many slots as stored entries, meaning that many slots have two or more entries
