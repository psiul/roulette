select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 498 and ss.ss_hash <= 698 and hd.hd_hash >= 414 and hd.hd_hash <= 914 and c.c_hash >= 513 and c.c_hash <= 613
;
