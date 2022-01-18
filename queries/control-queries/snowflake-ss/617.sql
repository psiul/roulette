select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 130 and ss.ss_hash <= 880 and c.c_hash >= 248 and c.c_hash <= 648 and hd.hd_hash >= 597 and hd.hd_hash <= 930
;
