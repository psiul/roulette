select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 532 and ss.ss_hash <= 865 and c.c_hash >= 7 and c.c_hash <= 757 and cd.cd_hash >= 592 and cd.cd_hash <= 992
;
