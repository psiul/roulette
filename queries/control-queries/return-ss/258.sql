select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 50 and hd.hd_hash <= 800 and i.i_hash >= 21 and i.i_hash <= 421 and c.c_hash >= 174 and c.c_hash <= 507
;
