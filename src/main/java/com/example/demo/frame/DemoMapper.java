package com.example.demo.frame;

import java.util.List;

public interface DemoMapper<K, V> {
    public int insert(V v);

    public void delete(K k);

    public int update(V v);

    public V select(K k);

    public List<V> selectAll();
}
