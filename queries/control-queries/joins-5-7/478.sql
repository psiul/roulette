select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 338 and i.i_hash <= 738 and hd.hd_hash >= 97 and hd.hd_hash <= 847 and c.c_hash >= 124 and c.c_hash <= 457
;
