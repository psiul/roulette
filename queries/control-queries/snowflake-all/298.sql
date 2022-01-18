select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 525 and ss.ss_hash <= 858 and c.c_hash >= 364 and c.c_hash <= 764 and hd.hd_hash >= 107 and hd.hd_hash <= 857
;
