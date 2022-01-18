select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 194 and c.c_hash <= 527 and hd.hd_hash >= 178 and hd.hd_hash <= 578 and cd.cd_hash >= 123 and cd.cd_hash <= 873
;
