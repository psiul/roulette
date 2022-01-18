select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 724 and i.i_hash <= 774 and cd.cd_hash >= 76 and cd.cd_hash <= 276 and c.c_hash >= 799 and c.c_hash <= 899
;
