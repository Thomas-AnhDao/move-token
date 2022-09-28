address admin {
module sotatoken {
  use aptos_framework::coin::{Self, BurnCapability, MintCapability, FreezeCapability};
  use std::signer;
  use std::string::utf8;

  struct SOTA {}

  struct Capabilities<phantom SOTA> has key {
    burn_cap: BurnCapability<SOTA>,
    mint_cap: MintCapability<SOTA>,
    freeze_cap: FreezeCapability<SOTA>,
  }

  const E_NO_ADMIN: u64 = 0;
  const E_NO_CAPABILITIES: u64 = 1;
  const E_HAS_CAPABILITIES: u64 = 2;

  public entry fun initialize(account: &signer) {
    let (burn_cap, freeze_cap, mint_cap) = coin::initialize<SOTA>(
      account,
      utf8(b"Sota Token"),
      utf8(b"SOTA"),
      9,
      true,
    );

    assert!(signer::address_of(account) == @admin, E_NO_ADMIN);
    assert!(!exists<Capabilities<SOTA>>(@admin), E_HAS_CAPABILITIES);

    move_to(
      account,
      Capabilities {
        burn_cap,
        freeze_cap,
        mint_cap,
      }
    );
  }

  public entry fun mint(account: &signer, receiver: address, amount: u64) acquires Capabilities {
    let account_addr = signer::address_of(account);
    assert!(account_addr == @admin, E_NO_ADMIN);
    assert!(exists<Capabilities<SOTA>>(account_addr), E_NO_CAPABILITIES);
    let cap = borrow_global<Capabilities<SOTA>>(account_addr);
    let coins_minted = coin::mint(amount, &cap.mint_cap);
    coin::deposit(receiver, coins_minted);
  }

  public entry fun burn(coins: coin::Coin<SOTA>) acquires Capabilities {
    let cap = borrow_global<Capabilities<SOTA>>(@admin);
    coin::burn<SOTA>(coins, &cap.burn_cap);
  }

  public entry fun register(account: &signer) {
    coin::register<SOTA>(account);
  }

  public entry fun transfer(sender: &signer, receiver: address, amount: u64) {
    coin::transfer<SOTA>(sender, receiver, amount);
  }
}
}