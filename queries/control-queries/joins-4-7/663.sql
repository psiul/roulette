select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 12 and ss.ss_hash <= 345 and c.c_hash >= 163 and c.c_hash <= 913 and hd.hd_hash >= 428 and hd.hd_hash <= 828
;
