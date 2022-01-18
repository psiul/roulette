select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 111 and hd.hd_hash <= 311 and c.c_hash >= 212 and c.c_hash <= 262 and cd.cd_hash >= 722 and cd.cd_hash <= 822
;
