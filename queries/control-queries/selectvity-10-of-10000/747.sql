select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 496 and ss.ss_hash <= 596 and hd.hd_hash >= 798 and hd.hd_hash <= 848 and c.c_hash >= 725 and c.c_hash <= 925
;
