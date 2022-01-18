select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 319 and ss.ss_hash <= 652 and c.c_hash >= 141 and c.c_hash <= 541 and cd.cd_hash >= 29 and cd.cd_hash <= 779
;
