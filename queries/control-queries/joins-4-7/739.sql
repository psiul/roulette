select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 140 and i.i_hash <= 473 and hd.hd_hash >= 555 and hd.hd_hash <= 955 and cd.cd_hash >= 130 and cd.cd_hash <= 880
;
