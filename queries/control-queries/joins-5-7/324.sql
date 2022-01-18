select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 655 and ss.ss_hash <= 988 and cd.cd_hash >= 490 and cd.cd_hash <= 890 and c.c_hash >= 144 and c.c_hash <= 894
;
