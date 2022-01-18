select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 496 and c.c_hash <= 896 and i.i_hash >= 612 and i.i_hash <= 945 and cd.cd_hash >= 121 and cd.cd_hash <= 871
;
