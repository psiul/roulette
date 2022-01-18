select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 749 and i.i_hash <= 849 and hd.hd_hash >= 150 and hd.hd_hash <= 350 and c.c_hash >= 475 and c.c_hash <= 975
;
