select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 585 and ss.ss_hash <= 685 and i.i_hash >= 741 and i.i_hash <= 791 and cd.cd_hash >= 21 and cd.cd_hash <= 41
;
