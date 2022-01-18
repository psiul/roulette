select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 534 and ss.ss_hash <= 867 and c.c_hash >= 212 and c.c_hash <= 962 and cd.cd_hash >= 543 and cd.cd_hash <= 943
;
