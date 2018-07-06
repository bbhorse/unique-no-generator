# unique-no-generator
1、使用资源文件中的数据库脚本创建表；

2、配置springbean，本例子基于spring java base配置实现。
    
    @Configuration
    public class AppConfig {

        @Bean
        public JdbcTemplate jdbcTemplate(@Qualifier("dataSource") DataSource dataSource) {
            return new JdbcTemplate(dataSource);
        }

        @Bean
        public SequenceKeyRepository sequenceKeyRepository(JdbcTemplate jdbcTemplate) {
            return new SequenceKeyRepository(jdbcTemplate);
        }

        @Bean
        public SequenceKeyService sequenceKeyService(SequenceKeyRepository sequenceKeyRepository) {
            return new SequenceKeyServiceImpl(sequenceKeyRepository);
        }

        @Bean
        public KeyGeneratorManager keyGeneratorManager(SequenceKeyService sequenceKeyService) {
            return new KeyGeneratorManager(sequenceKeyService);
        }
    }

3、使用。

    @Service
    public class UniqueNoServiceImpl implements UniqueNoService {

        @Resource
        private KeyGeneratorManager keyGeneratorManager;

        @Override
        public Long uniqueNo(String uniqueKey) {
            return keyGeneratorManager.getKeyGenerator(uniqueKey).nextId();
        }
    }
