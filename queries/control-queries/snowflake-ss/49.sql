select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 102 and ss.ss_hash <= 502 and hd.hd_hash >= 103 and hd.hd_hash <= 853 and i.i_hash >= 35 and i.i_hash <= 368
;
