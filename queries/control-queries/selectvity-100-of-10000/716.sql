select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 259 and ss.ss_hash <= 359 and i.i_hash >= 594 and i.i_hash <= 794 and cd.cd_hash >= 259 and cd.cd_hash <= 759
;
