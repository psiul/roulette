select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 139 and hd.hd_hash <= 159 and c.c_hash >= 88 and c.c_hash <= 138 and i.i_hash >= 677 and i.i_hash <= 777
;
