select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 489 and ss.ss_hash <= 822 and i.i_hash >= 23 and i.i_hash <= 773 and cd.cd_hash >= 464 and cd.cd_hash <= 864
;
