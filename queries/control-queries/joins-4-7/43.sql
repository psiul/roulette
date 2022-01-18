select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 229 and ss.ss_hash <= 562 and i.i_hash >= 217 and i.i_hash <= 967 and cd.cd_hash >= 0 and cd.cd_hash <= 400
;
