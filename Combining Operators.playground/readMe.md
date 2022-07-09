## Key points

- You can use the prepend and append families of operators to add emissions from one publisher before or after a different publisher.
- While switchToLatest is relatively complex, it’s extremely useful. It takes a publisher that emits publishers, switches to the latest publisher and cancels the subscription to the previous publisher.
- merge(with:) lets you interleave values from multiple publishers.
- combineLatest emits the latest values of all combined publishers whenever any of them emit a value, once all of the combined publishers have emitted at least one value.
- zip pairs emissions from different publishers, emitting a tuple of pairs after all publishers have emitted an value.
- You can mix combination operators to create interesting and complex relationships between publishers and their emissions.

```
prepend. append, switchToLatest, merge, combinelatest, zip
```
