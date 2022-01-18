select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 591 and ss.ss_hash <= 691 and i.i_hash >= 170 and i.i_hash <= 190 and hd.hd_hash >= 602 and hd.hd_hash <= 652
;
