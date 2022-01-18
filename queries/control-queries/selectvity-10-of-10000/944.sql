select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 711 and i.i_hash <= 911 and hd.hd_hash >= 794 and hd.hd_hash <= 894 and cd.cd_hash >= 408 and cd.cd_hash <= 458
;
