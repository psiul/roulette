select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 67 and c.c_hash <= 817 and cd.cd_hash >= 98 and cd.cd_hash <= 431 and i.i_hash >= 256 and i.i_hash <= 656
;
