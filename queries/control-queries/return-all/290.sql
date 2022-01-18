select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 211 and c.c_hash <= 611 and i.i_hash >= 438 and i.i_hash <= 771 and cd.cd_hash >= 12 and cd.cd_hash <= 762
;
