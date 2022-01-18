select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 452 and ss.ss_hash <= 785 and i.i_hash >= 317 and i.i_hash <= 717 and hd.hd_hash >= 64 and hd.hd_hash <= 814
;
