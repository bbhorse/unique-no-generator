package com.bob.unique.no.generator;

/**
 * @author YuBo
 */
public interface SequenceKeyService {

    SequenceKey loadSequenceKey(String key);

    SequenceKey loadSequenceById(Integer id);

    boolean compareAndSet(Integer id, Long oldValue, Long newValue);
}
