select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 479 and i.i_hash <= 879 and hd.hd_hash >= 338 and hd.hd_hash <= 671 and cd.cd_hash >= 10 and cd.cd_hash <= 760
;
