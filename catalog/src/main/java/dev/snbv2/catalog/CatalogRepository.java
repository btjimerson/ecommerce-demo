package dev.snbv2.catalog;

import java.util.UUID;

import org.springframework.data.repository.CrudRepository;

public interface CatalogRepository extends CrudRepository<CatalogItem, UUID> {
    
}
