package com.example.demo.frame;

import java.util.List;

public interface DemoMapper<K, V> {
    public void insert(V v);

    public void delete(K k);

    public void update(V v);

    public V select(K k);

    public List<V> selectAll();
}
