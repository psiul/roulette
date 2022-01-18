select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 204 and ss.ss_hash <= 954 and hd.hd_hash >= 167 and hd.hd_hash <= 567 and c.c_hash >= 543 and c.c_hash <= 876
;
