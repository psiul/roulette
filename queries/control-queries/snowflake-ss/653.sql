select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 244 and i.i_hash <= 577 and hd.hd_hash >= 317 and hd.hd_hash <= 717 and cd.cd_hash >= 85 and cd.cd_hash <= 835
;
