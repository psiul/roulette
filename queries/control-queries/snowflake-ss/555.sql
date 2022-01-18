select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 530 and ss.ss_hash <= 930 and cd.cd_hash >= 154 and cd.cd_hash <= 487 and i.i_hash >= 232 and i.i_hash <= 982
;
