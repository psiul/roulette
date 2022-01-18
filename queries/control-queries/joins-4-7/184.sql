select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 90 and cd.cd_hash <= 423 and c.c_hash >= 288 and c.c_hash <= 688 and hd.hd_hash >= 99 and hd.hd_hash <= 849
;
