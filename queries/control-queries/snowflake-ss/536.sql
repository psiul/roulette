select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 594 and ss.ss_hash <= 927 and cd.cd_hash >= 311 and cd.cd_hash <= 711 and c.c_hash >= 156 and c.c_hash <= 906
;
