# Artist Biography Migration Dry Run

Generated: 2026-08-06T02:51:57.244Z

Batch size: 50

## Summary

```json
{
  "batchSize": 50,
  "byLocale": {
    "en": {
      "eligible": 564,
      "normalizationChanged": 0,
      "ready": 564,
      "skipped_empty": 19
    },
    "es": {
      "eligible": 17,
      "normalizationChanged": 0,
      "skipped_empty": 566,
      "ready": 17
    }
  }
}
```

## Legacy consolidation

- Eligible bio → bio_en copies: 0
- Differing populated bio/bio_en variants: 12
- Both bio and bio_en empty: 19

## Discarded non-authoritative bio variants

| Artist UUID | Name | Slug | bio SHA-256 | bio_en SHA-256 | Result |
|---|---|---|---|---|---|
| 02f23257-1cf6-4a4c-8df1-1f9aa630a2c3 | Ramón Orlando & Orquesta Internacional | ramon-orlando | e48544f4c35504556afc9dcf0b3e658ff1d6c314a74e06b80a26d51be19a3ec1 | 314f45fc2f875cb67b8887f49fd931a1387bdef3eb418dca0aedb15d11ebbd69 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 0760875d-6b6f-4a48-8aed-6e57934d1baa | Luis Vargas | luis-vargas | 54632fc70843c7a6cf820662a7ea2dbf7488fa78f56d3de6be5ac58190d9f12b | fd66d6f1bf5d25c2c72a234c236e01443e942a9998fc5c54c3471e94e15c28a0 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 080c0205-8b66-4f16-915e-1d867acf82cc | Maridalia Hernández | maridalia-hernandez | 7040b5f7545dea247a4467e446cc7ebcf421928d42a08aa4a0782bfe9a392993 | c5d77c9614c03a50440b38f5d51bfcefdd90e6c11e1eabd39d7954326d536858 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 0dee2e87-7680-4300-8038-a57c419e76c3 | Crispín Fernández | crispin-fernandez | 71722b7c159b229ed0ca47deca0a211c457ab77385899593d20cada76b0cb52a | 2a4ca7aaa86149e7df6453c92be9e6b0b40f452c9ce1d7c861a89c25801de958 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 10034596-47cb-46ba-9e80-9ea319a2c0df | Juan Luis Guerra 4.40 | juan-luis-guerra | 4c7fe0a96e0c4f8ed968b9ee1b9aa41e06e0a20eb3edf0917adf88bb6f6458d5 | 3b709d3f89670bf6f87baa8ffe2dfd59ca3e211b897a79304bae7f17c9d51d8a | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 2bc36959-dcce-4e10-9ecf-2cd418eaa489 | Wilfrido Vargas | wilfrido-vargas | bb1744fc5f09897810c4368a334a1b0b50ef7b5bef539d7e100b5007229c8963 | f1e89b4f4c941cd7101ee96b409eb68e115ffdc0c8bc462d6752ebb7cc19c8db | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 2cb00350-16da-41b4-bec9-5c86b5d8438c | Frank Cruz | frank-cruz | cbc3f6667fae75542fe9112414b9fa4f7a663dbc41418029e214e1c0db33f1aa | c890df3ba33d1e27057ff6e4fc7b4d5d3e45dc8a8cb3cf0c627ec43634a7dd1a | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 4fc8bfd1-17ee-4750-b5e3-12e3491fe2ad | Zeo Muñoz | zeo-munoz | 75153b10758bf24642e5894ecf3f0c43a650f066eaeef8acce014b7790849e06 | ac50b9e03488d502132d3faa1de26366dffabf85a1e2895dd36879db4c789a86 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| 6c3e0d74-23b7-4d80-969f-9d5319ee5127 | Alex Bueno | alex-bueno | 4af34e0899eed7573ec41493188d5fb57d5d9c0308817986153d47b2b3c33f19 | eb54f04b9cc31e8e2e61cb97ceca3df6c07870d556f4166b7c8e4399902ccaf8 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| c6551ff1-ed33-4191-9c51-f89eec7d2be9 | Angel Viloria y su Conjunto Típico Cibaeño | angel-viloria-y-su-conjunto-tipico-cibaeno | 7dba1105a187584eefd172208cf86fb19383dfdfdfc7578f961aa5a15d7311b5 | 2352510245bb2f7b00f9dd5fff05b8ea19b60d66d76049a9bdbda9f3bacfaf65 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| ef56311a-ac4b-451e-a7a7-97e5f240cd47 | Luny Tunes | luny-tunes | d729b6708fe78e0b4b299813bb3e27b735ba3c56fd99dbf5ed55709248cb7d72 | fd6fb154a083a9e05fccd13bf0e18652fdbf53c995bf8153958416aeaa4857cc | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |
| fb2c703f-5362-47dd-ada0-7c6d5e106f3b | Dioni Fernández y El Equipo | dioni-fernandez-y-el-equipo | 85c0bbecfd93f3e41372d48d422e2f9ef5e597a7bb9438a2ca58b5c2ba3cb051 | 188fb2723996c8e051a650a1ee4b9a65a659adcbae3e432da0c835f6e67812c0 | discarded_non_authoritative_bio_variant; bio_en preserved and ready for migration |

## Exceptions and skips

| Artist UUID | Slug | Locale | Result | Source SHA-256 | Document SHA-256 | Derived SHA-256 | Detail |
|---|---|---|---|---|---|---|---|
