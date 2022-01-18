select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 145 and ss.ss_hash <= 895 and c.c_hash >= 571 and c.c_hash <= 971 and hd.hd_hash >= 205 and hd.hd_hash <= 538
;
