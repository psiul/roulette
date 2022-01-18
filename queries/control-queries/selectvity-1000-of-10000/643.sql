select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 228 and i.i_hash <= 978 and c.c_hash >= 606 and c.c_hash <= 939 and hd.hd_hash >= 153 and hd.hd_hash <= 553
;
